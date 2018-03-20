/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package utn.frc.dlc.sac;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;

/**
 *
 * @author scarafia
 */
public class Fecha extends GregorianCalendar {

    public static final String SPANISH = "ES";
    public static final String ARGENTINA = "AR";
    private static final String DEFAULT_MASK = "yyyy-MM-dd";

    // Locale (language, country, variant)
    private Locale outputLocale = null;
    private String mask = null;

    public Fecha(Date date, Locale outputLocale) {
        super();
        this.outputLocale = outputLocale;
        this.setTime(date);
    }

    public Fecha(Date date, String outputLanguage) {
        this(date, new Locale(outputLanguage));
    }

    public Fecha(Date date) {
        this(date, new Locale(SPANISH, ARGENTINA));
    }

    public Fecha(long date, Locale outputLocale) {
        this(new Date(date), outputLocale);
    }

    public Fecha(long date, String outputLanguage) {
        this(date, new Locale(outputLanguage));
    }

    public Fecha(long date) {
        this(new Date(date));
    }

    public Fecha() {
        this(new Date(), new Locale(SPANISH, ARGENTINA));
    }

    public String getMask() {
        return this.mask;
    }

    public void setMask(String mask) {
        this.mask = mask;
    }

    public Locale getOutputLocale() {
        return this.outputLocale;
    }

    public void setOutputLocale(Locale outputLocale) {
        this.outputLocale = outputLocale;
    }

    public void setOutputLocale(String outputLanguage) {
        this.setOutputLocale(new Locale(outputLanguage));
    }

    public void setOutputLocale(String outputLanguage, String outputCountry) {
        this.setOutputLocale(new Locale(outputLanguage, outputCountry));
    }

    public Date getDate() {
        return this.getTime();
    }

    public void setDate(Date date) {
        this.setTime(date);
    }

    public void setDate(long date) {
        this.setTime(new Date(date));
    }

    public void setDate(String date, String mask) throws Exception {
        if (mask == null) {
            throw new Exception("Fecha Error: se intenta crear una fecha sin máscara.");
        }
        DateFormat df = null;
        try {
            df = new SimpleDateFormat(mask);
        } catch (Exception e) {
            throw new Exception("Fecha Error: se intenta crear una fecha con máscara incomptable o incorrecta.");
        }
        this.setTime(df.parse(date));
    }

    public void setDate(String date) throws Exception {
        String m = this.mask;
        if (m == null) {
            m = DEFAULT_MASK;
        }
        this.setDate(date, m);
    }

    public int getYear() {
        return this.get(GregorianCalendar.YEAR);
    }

    public int getMonth() {
        return this.get(GregorianCalendar.MONTH);
    }

    public int getDay() {
        return this.get(GregorianCalendar.DAY_OF_MONTH);
    }

    public int getDayOfWeek() {
        return this.get(GregorianCalendar.DAY_OF_WEEK);
    }

    public int getHour() {
        return this.get(GregorianCalendar.HOUR_OF_DAY);
    }

    public int getMin() {
        return this.get(GregorianCalendar.MINUTE);
    }

    public int getSec() {
        return this.get(GregorianCalendar.SECOND);
    }

    public int getMilSec() {
        return this.get(GregorianCalendar.MILLISECOND);
    }

    public void add(Date date) {
        if (date == null) {
            return;
        }
        long f1 = date.getTime();
        long f2 = this.getDate().getTime();
        this.setDate(f1 + f2);
    }

    public void add(Fecha fecha) {
        if (fecha == null) {
            return;
        }
        this.add(fecha.getDate());
    }

    public void addYears(int years) {
        this.add(GregorianCalendar.YEAR, years);
    }

    public void addMonths(int months) {
        this.add(GregorianCalendar.MONTH, months);
    }

    public void addDays(int days) {
        this.add(GregorianCalendar.DAY_OF_MONTH, days);
    }

    public void addHours(int hours) {
        this.add(GregorianCalendar.HOUR_OF_DAY, hours);
    }

    public void addMinutes(int minutes) {
        this.add(GregorianCalendar.MINUTE, minutes);
    }

    public void addSeconds(int seconds) {
        this.add(GregorianCalendar.SECOND, seconds);
    }

    public void addMilliSeconds(int milliseconds) {
        this.add(GregorianCalendar.MILLISECOND, milliseconds);
    }

    public boolean after(Fecha when) {
        return this.getDate().after(when.getDate());
    }

    public boolean afterequals(Fecha when) {
        return (this.getDate().after(when.getDate()) || this.getDate().equals(when.getDate()));
    }

    public boolean before(Fecha when) {
        return this.getDate().before(when.getDate());
    }

    public boolean beforeequals(Fecha when) {
        return (this.getDate().before(when.getDate()) || this.getDate().equals(when.getDate()));
    }

    public String format(Locale outputLocale, String mask) {
        DateFormat df = new SimpleDateFormat(mask, outputLocale);
        return df.format(this.getDate());
    }

    public String format(String outputLanguage, String mask) {
        Locale ol = new Locale(outputLanguage);
        return this.format(ol, mask);
    }

    public String format(String outputLanguage, String outputCountry, String mask) {
        Locale ol = new Locale(outputLanguage, outputCountry);
        return this.format(ol, mask);
    }

    public String format(Locale outputLocale) {
        String m = this.mask;
        if (m == null) {
            m = DEFAULT_MASK;
        }
        return this.format(outputLocale, m);
    }

    public String format(String mask) {
        DateFormat df = null;
        if (this.outputLocale != null) {
            df = new SimpleDateFormat(mask, this.outputLocale);
        } else {
            df = new SimpleDateFormat(mask);
        }
        return df.format(this.getDate());
    }

    public String toString() {
        String m = this.mask;
        if (m == null) {
            m = DEFAULT_MASK;
        }
        return this.format(m);
    }

}
