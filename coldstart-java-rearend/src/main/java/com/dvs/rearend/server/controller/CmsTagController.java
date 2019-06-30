package com.dvs.rearend.server.controller;

import com.dvs.rearend.common.base.BaseController;
import com.dvs.rearend.common.constant.UpmsResult;
import com.dvs.rearend.common.constant.UpmsResultConstant;
import com.dvs.rearend.dao.model.CmsTag;
import com.dvs.rearend.dao.model.CmsTagExample;
import com.dvs.rearend.service.CmsTagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/tag")
public class CmsTagController extends BaseController {

    @Autowired
    CmsTagService cmsTagService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public Object tagList(HttpServletRequest request, HttpServletResponse response) {
        CmsTagExample example = new CmsTagExample();
        List<CmsTag> list = cmsTagService.selectByExample(example);
        return new UpmsResult(UpmsResultConstant.SUCCESS, list);
    }
}
