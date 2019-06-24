package com.dvs.rearend.rpc.service.impl;

import com.zheng.common.annotation.BaseService;
import com.zheng.common.base.BaseServiceImpl;
import com.dvs.rearend.dao.mapper.CmsArticleCategoryMapper;
import com.dvs.rearend.dao.model.CmsArticleCategory;
import com.dvs.rearend.dao.model.CmsArticleCategoryExample;
import com.dvs.rearend.rpc.api.CmsArticleCategoryService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* CmsArticleCategoryService实现
* Created by shuzheng on 2019/6/24.
*/
@Service
@Transactional
@BaseService
public class CmsArticleCategoryServiceImpl extends BaseServiceImpl<CmsArticleCategoryMapper, CmsArticleCategory, CmsArticleCategoryExample> implements CmsArticleCategoryService {

    private static final Logger LOGGER = LoggerFactory.getLogger(CmsArticleCategoryServiceImpl.class);

    @Autowired
    CmsArticleCategoryMapper cmsArticleCategoryMapper;

}