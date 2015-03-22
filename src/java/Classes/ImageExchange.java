/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import java.awt.image.BufferedImage;
import java.awt.image.DataBufferByte;
import java.awt.image.WritableRaster;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import javax.imageio.ImageIO;

/**
 *
 * @author Indunil
 */
public class ImageExchange {
    
    String url;
    BufferedImage image;
    FileInputStream inputFile;
    
    //create buffered image
    public BufferedImage createImageFile() throws IOException{
        BufferedImage bufferedImage = ImageIO.read(new File(this.url));
        
        return bufferedImage;
    }
    
    //create file input stream
    public FileInputStream inputFile() throws FileNotFoundException{
        FileInputStream fis = new FileInputStream(new File(this.url));
        
        return fis;
    }
    
    //method 1 for get byte array
    public byte[] extractBytes() throws IOException {
        // get DataBufferBytes from Raster
        WritableRaster raster = this.image.getRaster();
        DataBufferByte data = (DataBufferByte) raster.getDataBuffer();

        return (data.getData());
    }
    
    //method 2 for get byte array
    public byte[] getbytes() throws IOException {
        File file = new File(this.url);
        
        byte[] fileContent = Files.readAllBytes(file.toPath());
        
        return (fileContent);
    }
}
