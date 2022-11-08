import java.sql.*;

public class DBConnectionTest {
    public static void main(String[] args) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL 드라이버 로드
            Connection conn = DriverManager.getConnection("jdbc:mysql:// localhost:3306/board", "first","first"); 
           // JDBC 연결, password는 root 계정 패스워드 입력 
            System.out.println("DB 연결 완료");

            Statement stmt = conn.createStatement();

            /* 데이터의 변경

            // 삽입
            //stmt.executeUpdate("insert into login(id,pw,name) values('id2','pw2','user2')");

            // 삭제
            //stmt.executeUpdate("delete from login where id = 'id2'");s

            //수정
            //stmt.executeUpdate("update login set name ='name11' where id = 'id1' ");

            */

            // 출력문
            ResultSet rs = stmt.executeQuery("select * from login");
           
            System.out.println("아이디" + " " + "비밀번호" + "  " + "이름");
            while (rs.next()){
                String id = rs.getString("id");
                String pw = rs.getString("pw");
                String name = rs.getString("name");
                int admin = rs.getInt("admin");

                System.out.println(id + "   " + pw + "  " + name + "    " + admin);

            }


            } catch (ClassNotFoundException e) {
            System.out.println("JDBC 드라이버 로드 에러 : " + e);
            } catch (SQLException e) {
            System.out.println("SQL 에러 : " + e);
            }



    }
}
