package com.dvs.rearend.rpc.service.impl;

import com.zheng.common.annotation.BaseService;
import com.zheng.common.base.BaseServiceImpl;
import com.dvs.rearend.dao.mapper.CmsTagMapper;
import com.dvs.rearend.dao.model.CmsTag;
import com.dvs.rearend.dao.model.CmsTagExample;
import com.dvs.rearend.rpc.api.CmsTagService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* CmsTagService实现
* Created by shuzheng on 2019/6/24.
*/
@Service
@Transactional
@BaseService
public class CmsTagServiceImpl extends BaseServiceImpl<CmsTagMapper, CmsTag, CmsTagExample> implements CmsTagService {

    private static final Logger LOGGER = LoggerFactory.getLogger(CmsTagServiceImpl.class);

    @Autowired
    CmsTagMapper cmsTagMapper;

}