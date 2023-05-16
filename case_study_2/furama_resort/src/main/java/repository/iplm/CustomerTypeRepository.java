package repository.iplm;

import model.CustomerType;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class CustomerTypeRepository implements repository.ICustomerTypeRepository {
    private static final String SELECT_ALL_CUSTOMER_TYPE="select * from customer_type;";
    @Override
    public Map<Integer,String> findAll() {
        Map<Integer,String>customerTypeMap=new LinkedHashMap<>();
        Connection connection=BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(SELECT_ALL_CUSTOMER_TYPE);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                int id=resultSet.getInt("id");
                String name=resultSet.getString("name");
                customerTypeMap.put(id,name);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerTypeMap;
    }
}

