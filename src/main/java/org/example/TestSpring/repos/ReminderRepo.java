package org.example.TestSpring.repos;

import org.example.TestSpring.domain.Reminder;
import org.example.TestSpring.domain.Status;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ReminderRepo extends CrudRepository<Reminder, Long> {
    List<Reminder> findByStatus(Status status);
}
