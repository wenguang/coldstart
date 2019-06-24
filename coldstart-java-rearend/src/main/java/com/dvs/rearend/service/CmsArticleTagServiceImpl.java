package com.dvs.rearend.rpc.service.impl;

import com.zheng.common.annotation.BaseService;
import com.zheng.common.base.BaseServiceImpl;
import com.dvs.rearend.dao.mapper.CmsArticleTagMapper;
import com.dvs.rearend.dao.model.CmsArticleTag;
import com.dvs.rearend.dao.model.CmsArticleTagExample;
import com.dvs.rearend.rpc.api.CmsArticleTagService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* CmsArticleTagService实现
* Created by shuzheng on 2019/6/24.
*/
@Service
@Transactional
@BaseService
public class CmsArticleTagServiceImpl extends BaseServiceImpl<CmsArticleTagMapper, CmsArticleTag, CmsArticleTagExample> implements CmsArticleTagService {

    private static final Logger LOGGER = LoggerFactory.getLogger(CmsArticleTagServiceImpl.class);

    @Autowired
    CmsArticleTagMapper cmsArticleTagMapper;

}