package repository.iplm;

import model.RentType;
import repository.IFacilityTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;

public class FacilityTypeRepository implements IFacilityTypeRepository {


    private static final String SELECT_ALL_FACILITY_TYPE="select * from facility_type;";
    @Override
    public Map<Integer,String> findAll() {
        Map<Integer,String>facilityTypeMap=new LinkedHashMap<>();
        Connection connection=BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(SELECT_ALL_FACILITY_TYPE);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                int id=resultSet.getInt("id");
                String name=resultSet.getString("name");
                RentType rentType=new RentType(id,name);
                facilityTypeMap.put(id,name);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return facilityTypeMap;
    }
}