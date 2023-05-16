package controller;

import model.Facility;
import service.IFacilityService;
import service.IFacilityTypeService;
import service.IRentTypeService;
import service.iplm.FacilityService;
import service.iplm.FacilityTypeService;
import service.iplm.RentTypeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Set;

@WebServlet(name = "FacilityServlet", value = "/facility")
public class FacilityServlet extends HttpServlet {
    private final IFacilityService facilityService=new FacilityService();
    private final IFacilityTypeService facilityTypeService=new FacilityTypeService();
    private final IRentTypeService rentTypeService=new RentTypeService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormCreate(request, response);
                break;
            case "edit":
                showFormEdit(request, response);
                break;
            case "search":
                search(request,response);
                break;
            default:
                showList(request, response);
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response) {
        String id=request.getParameter("id");
        String name=request.getParameter("name");
        List<Facility>facilityList=facilityService.search(id,name);
        Map<Integer,String> facilityTypeMap=facilityTypeService.findAll();
        Map<Integer,String>rentTypeMap=rentTypeService.findAll();
        request.setAttribute("facilityList",facilityList);
        request.setAttribute("facilityTypeMap",facilityTypeMap);
        request.setAttribute("rentTypeMap",rentTypeMap);
        try {
            request.getRequestDispatcher("view/facility/list.jsp").forward(request,response);
        } catch (ServletException ex) {
            ex.printStackTrace();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
}



    private void showList(HttpServletRequest request, HttpServletResponse response) {
        try {
            List<Facility>facilityList=facilityService.findAll();
            Map<Integer,String> facilityTypeMap=facilityTypeService.findAll();
            Map<Integer,String>rentTypeMap=rentTypeService.findAll();
            request.setAttribute("facilityList",facilityList);
            request.setAttribute("facilityTypeMap",facilityTypeMap);
            request.setAttribute("rentTypeMap",rentTypeMap);
            request.getRequestDispatcher("view/facility/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        try {
            List<Facility>facilityList=facilityService.findAll();
            Map<Integer,String> facilityTypeMap=facilityTypeService.findAll();
            Map<Integer,String>rentTypeMap=rentTypeService.findAll();
            Set<Integer> idSetFacilityType=facilityTypeMap.keySet();
            Set<Integer> idSetRentType=rentTypeMap.keySet();
            request.setAttribute("idSetFacilityType",idSetFacilityType);
            request.setAttribute("idSetRentType",idSetRentType);
            request.setAttribute("facilityList",facilityList);
            request.setAttribute("facilityTypeMap",facilityTypeMap);
            request.setAttribute("rentTypeMap",rentTypeMap);
            request.getRequestDispatcher("view/facility/create.jsp").forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormEdit(HttpServletRequest request, HttpServletResponse response) {
        int id=Integer.parseInt(request.getParameter("id"));
        Facility facility=facilityService.findById(id);
        Map<Integer,String> facilityTypeMap=facilityTypeService.findAll();
        Map<Integer,String>rentTypeMap=rentTypeService.findAll();
        Set<Integer> idSetFacilityType=facilityTypeMap.keySet();
        Set<Integer> idSetRentType=rentTypeMap.keySet();
        request.setAttribute("idSetFacilityType",idSetFacilityType);
        request.setAttribute("idSetRentType",idSetRentType);
        request.setAttribute("facilityTypeMap",facilityTypeMap);
        request.setAttribute("rentTypeMap",rentTypeMap);
        request.setAttribute("facility",facility);
        try {
            request.getRequestDispatcher("view/facility/edit.jsp").forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "save":
                save(request, response);
                break;
            case "edit":
                edit(request, response);
                break;
            case "delete":
                delete(request, response);
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int id=Integer.parseInt(request.getParameter("id"));
        boolean check=facilityService.delete(id);
        String mess="Delete success!!!!";
        if (!check){
            mess="Delete failed!!!";
        }
        request.setAttribute("mess",mess);
        showList(request,response);
    }

    private void edit(HttpServletRequest request, HttpServletResponse response) {
        int id=Integer.parseInt(request.getParameter("id"));
        String name=request.getParameter("name");
        int area=Integer.parseInt(request.getParameter("area"));
        double cost=Double.parseDouble(request.getParameter("cost"));
        int maxPeople=Integer.parseInt(request.getParameter("maxPeople"));
        int rentTypeId=Integer.parseInt(request.getParameter("rentTypeId"));
        int facilityTypeId=Integer.parseInt(request.getParameter("facilityTypeId"));
        String standardRoom=request.getParameter("standardRoom");
        String descriptionOtherConvenience=request.getParameter("descriptionOtherConvenience");
        double poolArea=Double.parseDouble(request.getParameter("poolArea"));
        int numberOfFloors=Integer.parseInt(request.getParameter("numberOfFloors"));
        String facilityFree=request.getParameter("facilityFree");
        Facility facility=new Facility(id,name,area,cost,maxPeople,rentTypeId,facilityTypeId,standardRoom,descriptionOtherConvenience,
                poolArea,numberOfFloors,facilityFree);
        boolean check=facilityService.edit(facility);
        String mess="edit success!!";
        if (!check){
            mess="edit failed";
        }
        request.setAttribute("mess",mess);
       showFormEdit(request,response);
    }


    private void save(HttpServletRequest request, HttpServletResponse response) {
         String name=request.getParameter("name");
         int area=Integer.parseInt(request.getParameter("area"));
         double cost=Double.parseDouble(request.getParameter("cost"));
         int maxPeople=Integer.parseInt(request.getParameter("maxPeople"));
         int rentTypeId=Integer.parseInt(request.getParameter("rentTypeId"));
         int facilityTypeId=Integer.parseInt(request.getParameter("facilityTypeId"));
         String standardRoom=request.getParameter("standardRoom");
         String descriptionOtherConvenience=request.getParameter("descriptionOtherConvenience");
         double poolArea=Double.parseDouble(request.getParameter("poolArea"));
         int numberOfFloors=Integer.parseInt(request.getParameter("numberOfFloors"));
         String facilityFree=request.getParameter("facilityFree");
         Facility facility=new Facility(name,area,cost,maxPeople,rentTypeId,facilityTypeId,standardRoom,descriptionOtherConvenience,
                 poolArea,numberOfFloors,facilityFree);
         boolean check=facilityService.save(facility);
         String mess="add success!!";
         if (!check){
             mess="add failed";
         }
         request.setAttribute("mess",mess);
         showFormCreate(request,response);
    }
}
