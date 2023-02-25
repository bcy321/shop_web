package com.bcyportfolio.shopping.utils;

import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class CryptoUtil {
    public static class SHA1 {


        public static String hash(String input) {
            return SHA1.hash(input, null);
        }

        public static String hash(String input, String fallback) {
            try {
                MessageDigest messageDigest = MessageDigest.getInstance("SHA-1");
                messageDigest.reset();
                messageDigest.update(input.getBytes(StandardCharsets.UTF_8));
                return String.format("%040x", new BigInteger(1, messageDigest.digest()));
            } catch (Exception ignored) {
                return fallback;
            }
        }
    }
    public static class Sha512 {
        public static String hash(String input, String fallback) {
            try {
                return Sha512.hash(input);
            } catch (Exception ignored) {
                return fallback;
            }
        }

        public static String hash(String input, String fallback, boolean toUpper) {
            try {
                return Sha512.hash(input, toUpper);
            } catch (Exception ignored) {
                return fallback;
            }
        }

        public static String hash(String input) throws NoSuchAlgorithmException {
            return Sha512.hash(input, false);
        }

        public static String hash(String input, boolean toUpper) throws NoSuchAlgorithmException {
            String output;
            MessageDigest messageDigest = MessageDigest.getInstance("SHA-512");
            messageDigest.reset();
            messageDigest.update(input.getBytes(StandardCharsets.UTF_8));
            output = String.format("%0128x", new BigInteger(1, messageDigest.digest()));
            return toUpper ? output.toUpperCase() : output.toLowerCase();
        }
    }

    private CryptoUtil() {
    }
}