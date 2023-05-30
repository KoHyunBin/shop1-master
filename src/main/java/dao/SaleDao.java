package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import logic.Sale;

@Repository
public class SaleDao {
	private NamedParameterJdbcTemplate template;
	private Map<String,Object> param = new HashMap<>();
	private RowMapper<Sale> mapper = 
			   new BeanPropertyRowMapper<>(Sale.class);
	@Autowired
	public void setDataSource(DataSource dataSource) {
		template = new NamedParameterJdbcTemplate(dataSource);
	}
	public int getMaxSaleId() { //saleid 최대값 조회
		return template.queryForObject
	   ("select ifnull(max(saleid),0) from sale",param,Integer.class);
	}
	public void insert(Sale sale) { //sale 테이블에 데이터 추가
		String sql = "insert into sale (saleid, userid, saledate)"
				+ " values (:saleid,:userid,now())";
		SqlParameterSource param =new BeanPropertySqlParameterSource(sale);
		template.update(sql, param);
	}
	public List<Sale> list(String userid) {
		String sql = "select * from sale where userid=:userid"
				+ " order by saleid desc"; //최근 주문 순서로 조회
		param.clear();
		param.put("userid", userid);
		return template.query(sql,param,mapper);
	}
}
