package com.dvs.rearend.service;

import com.dvs.rearend.common.annotation.BaseService;
import com.dvs.rearend.common.base.BaseServiceImpl;
import com.dvs.rearend.dao.mapper.CmsTopicMapper;
import com.dvs.rearend.dao.model.CmsTopic;
import com.dvs.rearend.dao.model.CmsTopicExample;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* CmsTopicService实现
* Created by shuzheng on 2019/6/24.
*/
@Service
@Transactional
@BaseService
public class CmsTopicServiceImpl extends BaseServiceImpl<CmsTopicMapper, CmsTopic, CmsTopicExample> implements CmsTopicService {

    private static final Logger LOGGER = LoggerFactory.getLogger(CmsTopicServiceImpl.class);

    @Autowired
    CmsTopicMapper cmsTopicMapper;

}