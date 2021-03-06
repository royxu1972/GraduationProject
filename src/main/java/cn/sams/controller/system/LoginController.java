package cn.sams.controller.system;

import cn.sams.common.util.Chk;
import cn.sams.entity.Teacher;
import cn.sams.entity.commons.ReturnObj;
import cn.sams.service.system.LoginService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


/**
 * Created by Fanpeng on 2016/12/26.
 *
 */
@Controller
@RequestMapping("/system/login")
public class LoginController {

    @Resource
    private LoginService loginService;

    @RequestMapping("index.do")
    public String toIndex() {
        return "/system/login";
    }

    @RequestMapping("login.do")
    @ResponseBody
    public ReturnObj login(HttpServletRequest req) {
        String id = req.getParameter("loginName");
        String pwd = req.getParameter("password");
        if (!Chk.spaceCheck(id) || !Chk.spaceCheck(pwd)) {
            /*return "ID/Password can't be empty !";*/
            return new ReturnObj("error", "工号/密码不能为空 !", null);
        }
        if (loginService.findTeacherByID(id) == null) {
            return new ReturnObj("error", "工号错误 !", null);
        }
        Teacher teacher = loginService.login(id, pwd);

        if (teacher == null) {
            return new ReturnObj("error", "密码错误 !", null);
        }
        HttpSession session = req.getSession();
        // 将登录的用户放入session中备用
        session.setAttribute("user", teacher);
        return new ReturnObj("success", "", teacher);
    }

    // 登出系统, 需要销毁session中的保存的用户信息
    @RequestMapping("loginOut.do")
    @ResponseBody
    public String loginOut(HttpServletRequest request) {
        HttpSession session = request.getSession(false);//防止创建Session
        if(session == null){
            return "success";
        }
        // 销毁session
        session.invalidate();
        return "success";
    }
}
