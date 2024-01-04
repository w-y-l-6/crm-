package com.bjpowernode.crm.workbench.service.impl;

import com.bjpowernode.crm.workbench.domain.Activity;
import com.bjpowernode.crm.workbench.mapper.ActivityMapper;
import com.bjpowernode.crm.workbench.service.ActivityService;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("activityService")
public class ActivityServiceImpl implements ActivityService
{
    @Autowired
    private ActivityMapper activityMapper;
    @Override
    public int saveCreatActivity(Activity activity) {
        return activityMapper.insertActivity(activity);
    }
    @Override
    public List<Activity> queryActivityForPageByCondition(Map<String, Object> map) {
        return activityMapper.selectActivityForPageByCondition(map);
    }

    @Override
    public long queryCountOfActivityByCondition(Map<String, Object> map) {
        return activityMapper.selectCountOfActivityByCondition(map);
    }

    @Override
    public Activity queryActivityById(String id) {
        return activityMapper.selectActivityById(id);
    }

    @Override
    public int saveEditActivity(Activity activity) {
        return activityMapper.updateActivity(activity);
    }

    @Override
    public int deleteActivityByIds(String[] ids) {
        return activityMapper.deleteActivityByIds(ids);
    }

    @Override
    public List<Activity> queryAllActivityForDetail() {
        return activityMapper.queryAllActivityForDetail();
    }

    @Override
    public List<Activity> queryActivityForDetailByIds(String[] ids) {
        return null;
    }

    @Override
    public int saveCreateActivityByList(List<Activity> activityList) {
        return 0;
    }

    @Override
    public Activity queryActivityForDetailById(String id) {
        return activityMapper.queryActivityForDetailById(id);
    }


    @Override
    public List<Activity> queryActivityForDetailByClueId(String clueId) {
        return null;
    }

    @Override
    public List<Activity> queryActivityForDetailByNameClueId(Map<String, Object> map) {
        return null;
    }

    @Override
    public List<Activity> queryActivityForDetailByName(String name) {
        return null;
    }
    
}
