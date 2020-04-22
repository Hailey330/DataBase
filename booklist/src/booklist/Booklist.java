package booklist;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Booklist {
	Connection con; // �������
	Statement stmt;
	ResultSet rs;

	// �������
	// 1. ����
//	int bookid;
//	String bookname;
//	String publisher;
//	int price;

	// 2. �迭
//	int bookid_arr[] = new int[10];
//	String bookname_arr[] = new String[10];
//	String publisher_arr[] = new String[10];
//	int price_arr[] = new int[10];

	// 3. ��ü (���� inner Ŭ����)
//	class Book {
//		int bookid;
//		String bookname;
//		String publisher;
//		int price;
//	}

	// 3. ��ü
	Book b1;
	// 4. ��ü �迭
	Book[] b_array;

	public Booklist() {
		// 3. ��ü ���
//		b1 = new Book();
		// 4. ��ü �迭 �ʱ�ȭ
		b_array = new Book[20];

		for (int i = 0; i < b_array.length; ++i)
			b_array[i] = new Book();
	}

//		b_array[0] = new Book();
//		b_array[1] = new Book();
//		b_array[2] = new Book();
//		b_array[3] = new Book();
//		b_array[4] = new Book();

	void getConnection() {
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		// 11g express edition �� orcl ��� XE �� �Է��Ѵ�.
		String userid = "c##madang"; // c## �߰�
		String pwd = "c##madang"; // c## �߰�

		// ����̹��� ã�� ����
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("����̹� �ε� ����");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		// �����ͺ��̽��� �����ϴ� ����
		try {
			System.out.println("�����ͺ��̽� ���� �غ�");
			con = DriverManager.getConnection(url, userid, pwd);
			System.out.println("�����ͺ��̽� ���� ����");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	void getBookDB() {

		String query = "SELECT bookid, bookname, publisher, price FROM book"; // SQL��

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			System.out.println("BOOK ID \tBOOK NAME \t\tPUBLISHER \t\t\tPRICE");

			int index = 0;
			while (rs.next()) {
				// 1. ����
//				bookid = rs.getInt(1);
//				bookname = rs.getString(2);
//				publisher = rs.getString(3);
//				price = rs.getInt(4);
//
//				printBook(bookid, bookname, publisher, price);
//				printBook2();

				// 2. �迭
//				bookid_arr[index] = rs.getInt(1));
//				bookname_arr[index] = rs.getString(2));
//				publisher_arr[index] = rs.getString(3));
//				price_arr[index] = rs.getInt(4));
//				
//				index = index + 1;
//				index++;
//				++index;
//				printBook(bookid_arr[0], bookname_arr[0], price_arr[0]);

				// 3. ��ü
//				b1.bookid = rs.getInt(1);
//				b1.bookname = rs.getString(2);
//				b1.publisher = rs.getString(3);
//				b1.price = rs.getInt(4);

				// 4. ��ü �迭
				b_array[index].bookid = rs.getInt(1);
				b_array[index].bookname = rs.getString(2);
				b_array[index].publisher = rs.getString(3);
				b_array[index].price = rs.getInt(4);

				index++;
			}

			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	// 1. ����
//	void printBook(int bookid, String bookname, String publisher, int price) {
//		System.out.println(bookid + "," + bookname + "," + publisher + "," + price);
//	}

	// 1-1. ���� 2���
//	void printBook2() {
//		System.out.println(bookid + "," + bookname + "," + publisher + "," + price);
//	}

	// 2. �迭
//	void printBookArr() {
//		for (int i = 0; i < 10; i++) {
//			System.out.print(bookid_arr[i] + "\t");
//			System.out.print(bookname_arr[i] + "\t\t");
//			System.out.print(publisher_arr[i] + "\t\t");
//			System.out.println(price_arr[i]);
//		}
//	}

	// 4. ��ü �迭
	void printBook_Obj_array() {
		for (int i = 0; i < 10; ++i) {
			System.out.print(b_array[i].bookid + "\t");
			System.out.print(b_array[i].bookname + "\t");
			System.out.print(b_array[i].publisher + "\t");
			System.out.println(b_array[i].price);
		}
	}

	// 3. ��ü
	void printBook_Object() {
		System.out.print(b1.bookid + "\t");
		System.out.print(b1.bookname + "\t");
		System.out.print(b1.publisher + "\t");
		System.out.println(b1.price);
	}

}