package repository.iplm;

import model.CustomerType;
import model.RentType;
import repository.IRentTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;

public class RentTypeRepository implements IRentTypeRepository {
    private static final String SELECT_ALL_RENT_TYPE="select * from rent_type;";
    @Override
    public Map<Integer,String> findAll() {
        Map<Integer,String>rentTypeMap=new LinkedHashMap<>();
        Connection connection=BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(SELECT_ALL_RENT_TYPE);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                int id=resultSet.getInt("id");
                String name=resultSet.getString("name");
                RentType rentType=new RentType(id,name);
                rentTypeMap.put(id,name);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rentTypeMap;
    }
}

