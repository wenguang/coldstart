package com.dvs.rearend.service;

import com.dvs.rearend.common.annotation.BaseService;
import com.dvs.rearend.common.base.BaseServiceImpl;
import com.dvs.rearend.dao.mapper.CmsCategoryMapper;
import com.dvs.rearend.dao.model.CmsCategory;
import com.dvs.rearend.dao.model.CmsCategoryExample;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* CmsCategoryService实现
* Created by shuzheng on 2019/6/24.
*/
@Service
@Transactional
@BaseService
public class CmsCategoryServiceImpl extends BaseServiceImpl<CmsCategoryMapper, CmsCategory, CmsCategoryExample> implements CmsCategoryService {

    private static final Logger LOGGER = LoggerFactory.getLogger(CmsCategoryServiceImpl.class);

    @Autowired
    CmsCategoryMapper cmsCategoryMapper;

}