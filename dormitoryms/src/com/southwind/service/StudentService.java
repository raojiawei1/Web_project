package com.southwind.service;

import java.util.List;

import com.southwind.entity.Student;

public interface StudentService {
    public List<Student> list();
    public List<Student> search(String key,String value);
    public void save(Student student);
    public void update(Student student,Integer oldDormitoryId);
    public void update(Student student);
    public void delete(Integer id,Integer dormitoryId);
    public List<Student> moveoutList();
    public List<Student> searchForMoveout(String key,String value);
    public List<Student> findByDormitoryId(Integer dormitoryId);
}