/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package utn.frc.dlc.sac.web;

/**
 *
 * @author scarafia
 */
public class Link {
    private String title = null;
    private String url = null;

    public Link() {
        super();
    }

    public Link(String title, String url) {
        super();
        this.title = title;
        this.url = url;
    }

    /**
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * @return the url
     */
    public String getUrl() {
        return url;
    }

    /**
     * @param url the url to set
     */
    public void setUrl(String url) {
        this.url = url;
    }

    public String toString() {
        String link = null;
        if (this.title != null && this.url != null)
            link = "<a href=\"" + this.url + "\">" + this.title + "</a>";
        return link;
    }

}
