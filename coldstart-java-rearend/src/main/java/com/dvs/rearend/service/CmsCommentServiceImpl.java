package com.dvs.rearend.rpc.service.impl;

import com.zheng.common.annotation.BaseService;
import com.zheng.common.base.BaseServiceImpl;
import com.dvs.rearend.dao.mapper.CmsCommentMapper;
import com.dvs.rearend.dao.model.CmsComment;
import com.dvs.rearend.dao.model.CmsCommentExample;
import com.dvs.rearend.rpc.api.CmsCommentService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* CmsCommentService实现
* Created by shuzheng on 2019/6/24.
*/
@Service
@Transactional
@BaseService
public class CmsCommentServiceImpl extends BaseServiceImpl<CmsCommentMapper, CmsComment, CmsCommentExample> implements CmsCommentService {

    private static final Logger LOGGER = LoggerFactory.getLogger(CmsCommentServiceImpl.class);

    @Autowired
    CmsCommentMapper cmsCommentMapper;

}