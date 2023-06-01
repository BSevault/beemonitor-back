package com.beemonitor.beemonitorback.dto.handler;

public abstract class AbstractDtoHandler {

    /**
     * Check if the string provided is null, and trims it if not.
     * @param pValue String to check and trim.
     * @return the checked and trimmed string
     */
    public static String checkAndClean(String pValue) {
        if (pValue == null || pValue.trim().isEmpty())
            return null;
        return pValue.trim();
    }

}
