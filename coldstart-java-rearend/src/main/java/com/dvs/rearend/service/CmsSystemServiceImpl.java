package com.dvs.rearend.service;

import com.dvs.rearend.common.annotation.BaseService;
import com.dvs.rearend.common.base.BaseServiceImpl;
import com.dvs.rearend.dao.mapper.CmsSystemMapper;
import com.dvs.rearend.dao.model.CmsSystem;
import com.dvs.rearend.dao.model.CmsSystemExample;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* CmsSystemService实现
* Created by shuzheng on 2019/6/24.
*/
@Service
@Transactional
@BaseService
public class CmsSystemServiceImpl extends BaseServiceImpl<CmsSystemMapper, CmsSystem, CmsSystemExample> implements CmsSystemService {

    private static final Logger LOGGER = LoggerFactory.getLogger(CmsSystemServiceImpl.class);

    @Autowired
    CmsSystemMapper cmsSystemMapper;

}