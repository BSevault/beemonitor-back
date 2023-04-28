package com.beemonitor.beemonitorback.dto.handler;

abstract class AbstractDtoHandler {

    protected static String checkAndClean(String pValue) {
        if (pValue == null || pValue.trim().isEmpty())
            return null;
        return pValue.trim();
    }

}
