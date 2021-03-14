package org.example.TestSpring.controllers;

import org.example.TestSpring.domain.Reminder;
import org.example.TestSpring.domain.Status;
import org.example.TestSpring.repos.ReminderRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {

    @Autowired
    private ReminderRepo reminderRepo;

    @GetMapping
    public String main(@RequestParam(required = false, defaultValue = "NONE") Status status, Model model) {
        Iterable<Reminder> reminders = reminderRepo.findAll();

        if (status != null && !status.toString().equals("NONE")) {
            reminders = reminderRepo.findByStatus(status);
        } else {
            reminders = reminderRepo.findAll();
        }
        model.asMap().put("status", status);
        model.asMap().put("reminders", reminders);
        return "main";
    }

    @PostMapping
    public String addReminder(Reminder reminder, Model model) {
        reminder.setStatus(Status.PENDING);
        reminderRepo.save(reminder);
        var reminders = reminderRepo.findAll();
        model.asMap().put("reminders", reminders);
        return "main";
    }

    @GetMapping("/edit/{reminder}")
    public String edit(@PathVariable Reminder reminder, Model model) {
        model.addAttribute("reminder", reminder);
        return "edit";
    }

    @PostMapping("/edit/{reminder}")
    public String edit(@RequestParam String text,
                       @RequestParam Status status,
                       @RequestParam("reminderId") Reminder reminder,
                       Model model) {
        reminder.setText(text);
        reminder.setStatus(status);
        reminderRepo.save(reminder);
        return "redirect:/";
    }

    @GetMapping("/delete/{reminder}")
    public String delete(@PathVariable Reminder reminder) {
        reminderRepo.delete(reminder);
        return "redirect:/";
    }
}