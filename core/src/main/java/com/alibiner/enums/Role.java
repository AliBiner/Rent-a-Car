package com.alibiner.enums;

public enum Role {
    ADMIN,
    CUSTOMER;

    public Role get(int code){
        switch (code){
            case 0:
                return ADMIN;
            case 1:
                return CUSTOMER;
        }
        return null;
    }
}
