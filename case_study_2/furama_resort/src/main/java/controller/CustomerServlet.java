package controller;

import model.Customer;
import model.CustomerType;
import service.ICustomerService;
import service.ICustomerTypeService;
import service.iplm.CustomerService;
import service.iplm.CustomerTypeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private final ICustomerTypeService customerTypeService = new CustomerTypeService();
    private final ICustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormCreate(request, response);
            case "edit":
                showFormEdit(request, response);
            case "search":
                search(request, response);
            default:
                showList(request, response);
        }
    }
    private void search(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        List<Customer> customerList=customerService.search(id,name);
        Map<Integer, String> customerTypeMap = customerTypeService.findAll();
        request.setAttribute("customerTypeMap", customerTypeMap);
        request.setAttribute("customerList", customerList);
        try {
            request.getRequestDispatcher("view/customer/list.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showFormEdit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.findById(id);
        Map<Integer, String> customerTypeMap = customerTypeService.findAll();
        Set<Integer> customerTypeIdSet = customerTypeMap.keySet();
        request.setAttribute("customer", customer);
        request.setAttribute("customerTypeIdSet", customerTypeIdSet);
        request.setAttribute("customerTypeMap", customerTypeMap);
        try {
            request.getRequestDispatcher("view/customer/edit.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        try {
            Map<Integer, String> customerTypeMap = customerTypeService.findAll();
            List<Customer> customerList = customerService.findAll();
            request.setAttribute("customerTypeMap", customerTypeMap);
            request.setAttribute("customerList", customerList);
            request.getRequestDispatcher("view/customer/list.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        try {
            Map<Integer, String> customerTypeMap = customerTypeService.findAll();
            Set<Integer> customerTypeIdSet = customerTypeMap.keySet();
            request.setAttribute("customerTypeMap", customerTypeMap);
            request.setAttribute("customerTypeIdSet", customerTypeIdSet);
            request.getRequestDispatcher("view/customer/create.jsp").forward(request, response);
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
            case "edit":
                edit(request, response);
            case "delete":
                delete(request, response);
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        boolean check=customerService.delete(id);
        String mess = "Delete thanh cong";
        if (!check) {
            mess = "Delete khong thanh cong";
        }
        request.setAttribute("mess", mess);
        showList(request, response);
    }

    private void edit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        int customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));
        String name = request.getParameter("name");
        Date dateOfBirth = Date.valueOf(request.getParameter("dateOfBirth"));
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Customer customer = new Customer(id, customerTypeId, name, dateOfBirth, gender, idCard, phoneNumber, email, address);
        boolean check = customerService.edit(customer);
        String mess = "Edit thanh cong";
        if (!check) {
            mess = "Edit khong thanh cong";
        }
        request.setAttribute("mess", mess);
        showFormEdit(request, response);
    }

    private void save(HttpServletRequest request, HttpServletResponse response) {
        int customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));
        String name = request.getParameter("name");
        Date dateOfBirth = Date.valueOf(request.getParameter("dateOfBirth"));
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Customer customer = new Customer(customerTypeId, name, dateOfBirth, gender, idCard, phoneNumber, email, address);
        boolean check = customerService.save(customer);
        String mess = "Them moi thanh cong";
        if (!check) {
            mess = "Them moi khong thanh cong";
        }
        request.setAttribute("mess", mess);
        showFormCreate(request, response);
    }
}

