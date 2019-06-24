package com.dvs.rearend.service;

import com.dvs.rearend.common.annotation.BaseService;
import com.dvs.rearend.common.base.BaseServiceImpl;
import com.dvs.rearend.dao.mapper.CmsSettingMapper;
import com.dvs.rearend.dao.model.CmsSetting;
import com.dvs.rearend.dao.model.CmsSettingExample;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* CmsSettingService实现
* Created by shuzheng on 2019/6/24.
*/
@Service
@Transactional
@BaseService
public class CmsSettingServiceImpl extends BaseServiceImpl<CmsSettingMapper, CmsSetting, CmsSettingExample> implements CmsSettingService {

    private static final Logger LOGGER = LoggerFactory.getLogger(CmsSettingServiceImpl.class);

    @Autowired
    CmsSettingMapper cmsSettingMapper;

}