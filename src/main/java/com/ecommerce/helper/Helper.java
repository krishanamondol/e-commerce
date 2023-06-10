package com.ecommerce.helper;

public class Helper {
    public static String get20Word(String text) {
        String[] words = text.trim().split("\\s+");
        StringBuilder result = new StringBuilder();
        int count = 0;
        for (String word : words) {
            if (count < 10) {
                result.append(word).append(" ");
                count++;
            } else {
                break;
            }
        }
        return result.append("...").toString().trim();
    }


}
