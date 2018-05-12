package com.zqwz.lan.controller;


import com.zqwz.lan.entity.*;
import com.zqwz.lan.service.ApplyService;
import com.zqwz.lan.service.DeviceService;
import com.zqwz.lan.service.LabService;
import com.zqwz.lan.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Resource
    private UserService userService;
    @Resource
    private LabService labService;
    @Resource
    private ApplyService applyService;
    @Resource
    private DeviceService deviceService;

    private HttpSession httpSession;

    @RequestMapping("/start.action")
    public String start(){
        return "login";
    }

    /**
     * 判断用户的类型
     * @param request
     * @param session
     * @return
     */
    @RequestMapping("/verify.action")
    public ModelAndView VerifyUser(HttpServletRequest request, HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        httpSession = session;
        String user_account = request.getParameter("userName");
        String user_pwd = request.getParameter("password");

        User user = userService.VerifyUser(user_account, user_pwd);
        httpSession.setAttribute("user",user);

        if(user != null){
            if(user.getUser_type().equals("管理员")){
                modelAndView.setViewName("admin/main");
            }else if(user.getUser_type().equals("用户")) {
                modelAndView.setViewName("employee/main");
            }
        }else{
            modelAndView.setViewName("redirect:../login.jsp");
        }
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping("/backUser.action")
    public User backUser(HttpServletRequest request){
        User user = (User) httpSession.getAttribute("user");
        return user;
    }

    /**
     * 注销
     * @return
     */
    @RequestMapping(value = "/logout.action")
    public String logout(){
        httpSession.invalidate();
        return "redirect:../login.jsp";
    }

    /************************************* 普通用户功能 **********************************/
    @RequestMapping(value="/editInfo.action")
    public String editInfo(User user) {
        User user2 = (User) httpSession.getAttribute("user");
        user.setUser_id(user2.getUser_id());

        userService.editInfo(user);
        return "employee/edit_information";
    }

    /**
     * 查询所有的实验室信息
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/findAllLab.action")
    public List<Lab> findAllLab(){
        List<Lab> labs = labService.findAllLab();
        return labs;
    }

    /**
     * 提交申请
     * @param applyLab
     * @return
     */
    @RequestMapping(value="/applyLab.action")
    public String submitApplyLab(ApplyLab applyLab) {
        User user = (User) httpSession.getAttribute("user");
        applyLab.setUser_id(user.getUser_id());
        applyService.submitApplyLab(applyLab);
        return "employee/apply_lab";
    }

    /**
     * 查询所有的设备信息
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/findAllDevice.action")
    public List<Device> findAllDevice(){
        List<Device> devices = deviceService.findAllDevice();
        return devices;
    }

    /**
     * 申请设备维修
     * @return
     */
    @RequestMapping(value="/applyDevice.action")
    public String submitApplyDevice(ApplyDevice applyDevice) {
        User user = (User) httpSession.getAttribute("user");
        applyDevice.setUser_id(user.getUser_id());
        applyService.submitApplyDevice(applyDevice);
        return "employee/apply_device";
    }

    /************************************* 管理用户功能 **********************************/

    /**
     * 查询所有的员工信息
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/findAllUser.action")
    public List<User> findAllUser(){
        List<User> users = userService.findUserByName("");
        return users;
    }

    /**
     * 通过用户输入的姓名模糊查询到员工
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/findUserByName.action")
    public List<User> findUserByName(HttpServletRequest request){
        String username = request.getParameter("username");
        List<User> users = userService.findUserByName(username);
        return users;
    }

    /**
     * 新增普通用户
     * @param user
     * @return
     */
    @RequestMapping(value="/addUser.action")
    public String addUser(User user) {
        userService.addUser(user);
        return "redirect:../admin/user.jsp";
    }

    /**
     * 通过user_id删除指定用户
     * @param request
     * @return
     */
    @RequestMapping(value="/deleteUser.action")
    public String deleteUser(HttpServletRequest request) {
        int user_id = Integer.parseInt(request.getParameter("user_id"));
        userService.deleteUser(user_id);
        return "admin/user";
    }

    /**
     * 通过用户输入的设备名模糊查询到设备信息
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/findDeviceByName.action")
    public List<Device> findDeviceByName(HttpServletRequest request){
        String devicename = request.getParameter("device_name");
        List<Device> devices = deviceService.findDeviceByName(devicename);
        return devices;
    }

    /**
     * 新增设备信息
     * @param device
     * @return
     */
    @RequestMapping(value="/addDevice.action")
    public String addDevice(Device device) {
        deviceService.addDevice(device);
        return "redirect:../admin/device.jsp";
    }

    /**
     * 删除设备信息
     * @param request
     * @return
     */
    @RequestMapping(value="/deleteDevice.action")
    public String deleteDevice(HttpServletRequest request) {
        int device_id = Integer.parseInt(request.getParameter("device_id"));
        deviceService.deleteDevice(device_id);
        return "redirect:../admin/device.jsp";
    }

    /**
     * 更新设备信息
     * @param device
     * @return
     */
    @RequestMapping(value="/updateDevice.action")
    public String updateDevice(Device device) {
        deviceService.updateDevice(device);
        return "redirect:../admin/device.jsp";
    }

    /**
     * 查询所有的申请实验室信息
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/findAllApplyLabByID.action")
    public List<ApplyLab> findAllApplyLabByID(HttpServletRequest request){
        String apply_id = request.getParameter("apply_id");
        if(apply_id == null) {
            apply_id = "";
        }
        List<ApplyLab> applyLabs = applyService.findAllApplyLabByID(apply_id);
        return applyLabs;
    }

    /**
     * 申请实验室通过
     * @param request
     * @return
     */
    @RequestMapping(value="/passApplyLab.action")
    public String passApplyLab(HttpServletRequest request) {
        int apply_id = Integer.parseInt(request.getParameter("apply_id"));
        User user = (User) httpSession.getAttribute("user");

        applyService.passApplyLab(apply_id, user.getUser_name());
        return "admin/apply_lab";
    }

    /**
     * 申请实验室不通过
     * @param request
     * @return
     */
    @RequestMapping(value="/notPassApplyLab.action")
    public String notPassApplyLab(HttpServletRequest request) {
        int apply_id = Integer.parseInt(request.getParameter("apply_id"));
        User user = (User) httpSession.getAttribute("user");

        applyService.notPassApplyLab(apply_id,user.getUser_name());
        return "admin/apply_lab";
    }

    /**
     * 查询所有的设备审批信息
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/findAllApplyDeviceByID.action")
    public List<ApplyDevice> findAllApplyDeviceByID(HttpServletRequest request){
        String apply_id = request.getParameter("apply_id");
        if(apply_id == null) {
            apply_id = "";
        }
        List<ApplyDevice> applyDevices = applyService.findAllApplyDeviceByID(apply_id);
        return applyDevices;
    }

    /**
     * 申请设备通过
     * @param request
     * @return
     */
    @RequestMapping(value="/passApplyDevice.action")
    public String passApplyDevice(HttpServletRequest request) {
        int apply_id = Integer.parseInt(request.getParameter("apply_id"));
        User user = (User) httpSession.getAttribute("user");

        applyService.passApplyDevice(apply_id, user.getUser_name());
        return "admin/apply_device";
    }

    /**
     * 申请设备不通过
     * @param request
     * @return
     */
    @RequestMapping(value="/notPassApplyDevice.action")
    public String notPassApplyDevice(HttpServletRequest request) {
        int apply_id = Integer.parseInt(request.getParameter("apply_id"));
        User user = (User) httpSession.getAttribute("user");

        applyService.notPassApplyDevice(apply_id, user.getUser_name());
        return "admin/apply_device";
    }

    /**
     * 通过用户输入的实验室名模糊查询到实验室信息
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/findLabByName.action")
    public List<Lab> findLabByName(HttpServletRequest request){
        String lab_id = request.getParameter("lab_id");
        List<Lab> labs = labService.findLabByName(lab_id);
        return labs;
    }

    /**
     * 通过实验室ID查询实验室信息
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/findLabByID.action")
    public Lab findLabByID(HttpServletRequest request) {
        int lab_id = Integer.parseInt(request.getParameter("lab_id"));
        Lab lab = labService.findLabByID(lab_id);
        return lab;
    }

    /**
     * 新增实验室信息
     * @return
     */
    @RequestMapping(value="/addLab.action")
    public String addLab(Lab lab) {
        labService.addLab(lab);
        return "admin/lab";
    }

    /**
     * 删除实验室信息
     * @param request
     * @return
     */
    @RequestMapping(value="/deleteLab.action")
    public String deleteLab(HttpServletRequest request) {
        int lab_id = Integer.parseInt(request.getParameter("lab_id"));
        labService.deleteLab(lab_id);
        return "admin/lab";
    }

    /**
     * 更新实验室信息
     * @param lab
     * @return
     */
    @RequestMapping(value="/updateLab.action")
    public String updateLab(Lab lab) {
        labService.updateLab(lab);
        return "admin/lab";
    }
}