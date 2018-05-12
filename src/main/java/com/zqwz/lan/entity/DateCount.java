package com.zqwz.lan.entity;

public class DateCount {
    public String date;
    public int count;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public DateCount(String date, int count) {
        this.date = date;
        this.count = count;
    }

    public DateCount() {
    }
}
