package cn.acyou.cancer.controller;

import cn.acyou.cancer.entity.Student;
import cn.acyou.cancer.mapper.StudentMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author youfang
 * @version [1.0.0, 2019-04-12 上午 09:36]
 **/
@Controller
@Slf4j
@RequestMapping("demo")
public class DemoController {

    @Autowired
    private StudentMapper studentMapper;

    @ResponseBody
    @RequestMapping("index")
    public List<Student> index(){
        List<Student> bosses = studentMapper.selectAll();
        bosses.forEach(x-> log.info(x.toString()));
        return bosses;
    }
}
