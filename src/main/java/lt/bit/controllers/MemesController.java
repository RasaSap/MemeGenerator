/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lt.bit.controllers;

import com.mysql.cj.jdbc.Blob;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import lt.bit.dao.ImagesDAO;
import lt.bit.dao.MemesDAO;
import lt.bit.data.Images;
import lt.bit.data.Memes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Lenovo
 */
@Controller
public class MemesController {

    @Autowired
    private ImagesDAO imagesDAO;

    @Autowired
    private MemesDAO memesDAO;

    @GetMapping("/")
    public ModelAndView photoList() {
        ModelAndView mav = new ModelAndView("index");
        mav.addObject("list", imagesDAO.findAll());

        return mav;
    }

    @GetMapping("/edit")
    public ModelAndView photoId(@RequestParam(name = "id", required = false) Integer id) {
        ModelAndView mav = new ModelAndView("edit");
        Images im = null;
        im = imagesDAO.getOne(id);
        mav.addObject("photo", im);
        return mav;
    }

    @PostMapping("/save")
    @Transactional
    public ModelAndView generateMeme(
            @RequestParam(name = "id", required = false) Integer id,
            @RequestParam(name = "topText", required = false) String topText,
            @RequestParam(name = "botText", required = false) String botText
    ) throws IOException {
        System.out.println(id);
        System.out.println(botText);

        ByteArrayInputStream bais = new ByteArrayInputStream(imagesDAO.getOne(id).getPhoto());

        BufferedImage image = ImageIO.read(bais);

        Graphics g = image.getGraphics();
        Font font = new Font(Font.SANS_SERIF, Font.BOLD, 60);
        g.setFont(font);
        g.setColor(Color.YELLOW);
        g.drawString(topText, 50, 100);
        g.setColor(Color.GREEN);
        g.drawString(botText, 50, 350);
        g.dispose();

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write(image, "jpg", baos);
        byte[] bytes = baos.toByteArray();

        Memes m = new Memes();
        m.setMeme(bytes);
        memesDAO.save(m);

        ModelAndView mav = new ModelAndView("showMeme");
        mav.addObject("meme", m);

        return mav;
    }

    @GetMapping("/memes")
    public ModelAndView memeList() {
        ModelAndView mav = new ModelAndView("memes");
        mav.addObject("memeList", memesDAO.findAll());
        return mav;
    }

}
