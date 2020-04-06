package ca.ubc.cs304.database;

import java.security.interfaces.RSAKey;
import java.sql.*;
import java.util.ArrayList;
import java.util.Random;

import ca.ubc.cs304.model.AccountModel;
import ca.ubc.cs304.model.BranchModel;
import ca.ubc.cs304.model.UserModel;
import oracle.sql.CHAR;

import javax.swing.plaf.nimbus.State;

/**
 * This class handles all database related transactions
 */
public class DatabaseConnectionHandler {
	// Use this version of the ORACLE_URL if you are running the code off of the server
//	private static final String ORACLE_URL = "jdbc:oracle:thin:@dbhost.students.cs.ubc.ca:1522:stu";
	// Use this version of the ORACLE_URL if you are tunneling into the undergrad servers
	private static final String ORACLE_URL = "jdbc:oracle:thin:@localhost:1522:stu";
	private static final String EXCEPTION_TAG = "[EXCEPTION]";
	private static final String WARNING_TAG = "[WARNING]";
	private static DatabaseConnectionHandler databaseConnectionHandler = null;
	
	private Connection connection = null;
	
	public DatabaseConnectionHandler() {
		try {
			// Load the Oracle JDBC driver
			// Note that the path could change for new drivers
			DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
		} catch (SQLException e) {
			System.out.println(EXCEPTION_TAG + " " + e.getMessage());
		}
	}

	public static DatabaseConnectionHandler getInstance() {
		if(databaseConnectionHandler == null) {
			databaseConnectionHandler = new DatabaseConnectionHandler();
		}
		return databaseConnectionHandler;
	}

	public void close() {
		try {
			if (connection != null) {
				connection.close();
			}
		} catch (SQLException e) {
			System.out.println(EXCEPTION_TAG + " " + e.getMessage());
		}
	}

	public void insertUser(AccountModel newAccount, int hcid) {
		int aid = newAccount.getAID();
		try {
			// Insert username, password, accountType into AHC1 table
			PreparedStatement ps = connection.prepareStatement("INSERT INTO AHC1 VALUES (ltrim(rtrim(?, ' '), ' '),ltrim(rtrim(?, ' '), ' '),ltrim(rtrim(?, ' '), ' '),ltrim(rtrim(?, ' '), ' '),ltrim(rtrim(?, ' '), ' '))");
			ps.setInt(1, aid);
			ps.setString(2, newAccount.getUsername());
			ps.setString(3, newAccount.getPassword());
			ps.setString(4, newAccount.getAccountType());
			ps.setString(5,newAccount.getStatus());

			ps.executeUpdate();
			connection.commit();

			// If accountType is donor
			if(newAccount.getAccountType().equals("DONOR")) {
				// Insert aid and hcid into DCA1 table
				ps = connection.prepareStatement("INSERT INTO DCA1 VALUES (ltrim(rtrim(?, ' '), ' '),ltrim(rtrim(?, ' '), ' '))");
				ps.setInt(1, hcid);
				ps.setInt(2, aid);

				ps.executeUpdate();
				connection.commit();

				// Insert aid into DCA2 table for later profile update
				ps = connection.prepareStatement("INSERT INTO DCA2 VALUES (ltrim(rtrim(?, ' '), ' '),ltrim(rtrim(?, ' '), ' '),ltrim(rtrim(?, ' '), ' '),ltrim(rtrim(?, ' '), ' '),ltrim(rtrim(?, ' '), ' '))");
				ps.setInt(1, aid);
				ps.setNull(2, Types.INTEGER); //AGE
				ps.setNull(3, Types.CHAR); //GENDER
				ps.setNull(4, Types.CHAR); //NAME
				ps.setNull(5, Types.CHAR); //BLOOD-TYPE

			}
			else {
				// Insert aid and hcid into RCA1 table
				ps = connection.prepareStatement("INSERT INTO RCA1 VALUES (ltrim(rtrim(?, ' '), ' '),ltrim(rtrim(?, ' '), ' '))");
				ps.setInt(1, hcid);
				ps.setInt(2, aid);

				ps.executeUpdate();
				connection.commit();

				// Insert aid into RCA2 table for later profile update
				ps = connection.prepareStatement("INSERT INTO RCA2 VALUES (ltrim(rtrim(?, ' '), ' '),ltrim(rtrim(?, ' '), ' '),ltrim(rtrim(?, ' '), ' '),ltrim(rtrim(?, ' '), ' '))");
				ps.setInt(1, aid);
				ps.setNull(2, Types.INTEGER);
				ps.setNull(3, Types.CHAR);
				ps.setNull(4, Types.CHAR);

			}
			ps.executeUpdate();
			connection.commit();

			ps.close();
		} catch (SQLException e) {
			System.out.println(EXCEPTION_TAG + " " + e.getMessage());
			rollbackConnection();
		}

	}

	public int userLogin(String username, String password) {
		int aid = 0;
		try{
			Statement stmt = connection.createStatement();
			String sql = "SELECT AID FROM ORA_YWO7W1B.AHC1 where USERNAME = '" + username +"' AND PASSWORD = '" + password +"'" ;
			ResultSet result = stmt.executeQuery(sql);
			if(result.next()){
				aid = result.getInt("aid");
				System.out.println("AID: " + aid);
			}
			else {
				System.out.println("Wrong password");
			}


			PreparedStatement ps = connection.prepareStatement("SELECT AID FROM ORA_YWO7W1B.AHC1 WHERE USERNAME = ?");
			ps.setString(1,username);
			//ps.setString(2,password);

			ResultSet rs = ps.executeQuery();

			if(rs.next()){
				aid = rs.getInt("aid");
				System.out.println("AID: " + aid + " username: ");
			}
		}
		catch (Exception e) {
			System.out.println(EXCEPTION_TAG + " " + e.getMessage());
			rollbackConnection();
		}
		return aid;
	}

	public UserModel getUserProfile(String aid) {
		UserModel myUser;
		try{
			Statement stmt = connection.createStatement();
			String sql = "SELECT ACCOUNTTYPE FROM AHC1 WHERE AID = " + aid;
			ResultSet result = stmt.executeQuery(sql);
			if(result.next()) {
				System.out.println("Account type from statement: " + result.getString("accountType"));
			}

			PreparedStatement ps = connection.prepareStatement("SELECT ACCOUNTTYPE FROM AHC1 WHERE AID = ? ");
			ps.setInt(1, Integer.parseInt(aid));

			ResultSet rs = ps.getResultSet();
			if(rs.next()) {
				String accountType = rs.getString("AccountType");
				System.out.println(accountType);
			}
			ps.close();
		}catch (Exception e) {
			System.out.println(EXCEPTION_TAG + " " + e.getMessage());
			rollbackConnection();
		}
		myUser = new UserModel("test");
		return myUser;
	}

	public void deleteBranch(int branchId) {
		try {
			PreparedStatement ps = connection.prepareStatement("DELETE FROM branch WHERE branch_id = ?");
			ps.setInt(1, branchId);
			
			int rowCount = ps.executeUpdate();
			if (rowCount == 0) {
				System.out.println(WARNING_TAG + " Branch " + branchId + " does not exist!");
			}
			
			connection.commit();
	
			ps.close();
		} catch (SQLException e) {
			System.out.println(EXCEPTION_TAG + " " + e.getMessage());
			rollbackConnection();
		}
	}
	
	public void insertBranch(BranchModel model) {
		try {
			PreparedStatement ps = connection.prepareStatement("INSERT INTO branch VALUES (?,?,?,?,?)");
			ps.setInt(1, model.getId());
			ps.setString(2, model.getName());
			ps.setString(3, model.getAddress());
			ps.setString(4, model.getCity());
			if (model.getPhoneNumber() == 0) {
				ps.setNull(5, java.sql.Types.INTEGER);
			} else {
				ps.setInt(5, model.getPhoneNumber());
			}

			ps.executeUpdate();
			connection.commit();

			ps.close();
		} catch (SQLException e) {
			System.out.println(EXCEPTION_TAG + " " + e.getMessage());
			rollbackConnection();
		}
	}
	
	public BranchModel[] getBranchInfo() {
		ArrayList<BranchModel> result = new ArrayList<BranchModel>();
		
		try {
			Statement stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM branch");
		
//    		// get info on ResultSet
//    		ResultSetMetaData rsmd = rs.getMetaData();
//
//    		System.out.println(" ");
//
//    		// display column names;
//    		for (int i = 0; i < rsmd.getColumnCount(); i++) {
//    			// get column name and print it
//    			System.out.printf("%-15s", rsmd.getColumnName(i + 1));
//    		}
			
			while(rs.next()) {
				BranchModel model = new BranchModel(rs.getString("branch_addr"),
													rs.getString("branch_city"),
													rs.getInt("branch_id"),
													rs.getString("branch_name"),
													rs.getInt("branch_phone"));
				result.add(model);
				System.out.println("response from db: " + rs.getString("branch_addr"));
			}

			rs.close();
			stmt.close();
		} catch (SQLException e) {
			System.out.println(EXCEPTION_TAG + " " + e.getMessage());
		}	
		
		return result.toArray(new BranchModel[result.size()]);
	}
	
	public void updateBranch(int id, String name) {
		try {
		  PreparedStatement ps = connection.prepareStatement("UPDATE branch SET branch_name = ? WHERE branch_id = ?");
		  ps.setString(1, name);
		  ps.setInt(2, id);
		
		  int rowCount = ps.executeUpdate();
		  if (rowCount == 0) {
		      System.out.println(WARNING_TAG + " Branch " + id + " does not exist!");
		  }
	
		  connection.commit();
		  
		  ps.close();
		} catch (SQLException e) {
			System.out.println(EXCEPTION_TAG + " " + e.getMessage());
			rollbackConnection();
		}	
	}
	
	public Connection login(String username, String password) {
		try {
			if (connection != null) {
				connection.close();
			}
	
			connection = DriverManager.getConnection(ORACLE_URL, username, password);
			connection.setAutoCommit(false);
	
			System.out.println("\nConnected to Oracle!");
			return connection;
		} catch (SQLException e) {
			System.out.println(EXCEPTION_TAG + " " + e.getMessage());
			return null;
		}
	}

	private void rollbackConnection() {
		try  {
			connection.rollback();	
		} catch (SQLException e) {
			System.out.println(EXCEPTION_TAG + " " + e.getMessage());
		}
	}
	
	public void databaseSetup() {
		dropBranchTableIfExists();
		
		try {
			Statement stmt = connection.createStatement();
			stmt.executeUpdate("CREATE TABLE branch (branch_id integer PRIMARY KEY, branch_name varchar2(20) not null, branch_addr varchar2(50), branch_city varchar2(20) not null, branch_phone integer)");
			stmt.close();
		} catch (SQLException e) {
			System.out.println(EXCEPTION_TAG + " " + e.getMessage());
		}
		
		BranchModel branch1 = new BranchModel("123 Charming Ave", "Vancouver", 1, "First Branch", 1234567);
		insertBranch(branch1);
		
		BranchModel branch2 = new BranchModel("123 Coco Ave", "Vancouver", 2, "Second Branch", 1234568);
		insertBranch(branch2);
	}
	
	private void dropBranchTableIfExists() {
		try {
			Statement stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery("select table_name from user_tables");
			
			while(rs.next()) {
				if(rs.getString(1).toLowerCase().equals("branch")) {
					stmt.execute("DROP TABLE branch");
					break;
				}
			}
			
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			System.out.println(EXCEPTION_TAG + " " + e.getMessage());
		}
	}
}
