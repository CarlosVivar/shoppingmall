package CONTROLLER;

import java.awt.Color;

import java.awt.Font;

import java.awt.GradientPaint;

import java.awt.Graphics2D;

import java.awt.RenderingHints;

import java.awt.image.BufferedImage;

import java.io.IOException;

import java.io.OutputStream;

import java.util.Random;

import javax.imageio.ImageIO;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

public class CaptchaServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request,

	HttpServletResponse response) throws ServletException, IOException {

		final int width = 200;

		final int height = 50;

		char data[][] = new char[1][];

		data[0] = getRandomNumber(8).toCharArray();

		final BufferedImage bufferedImage = new BufferedImage(width, height,

		BufferedImage.TYPE_INT_RGB);

		final Graphics2D g2d = bufferedImage.createGraphics();

		final Font font = new Font("verdana", Font.BOLD, 18);

		RenderingHints renderingHints = new RenderingHints(

		RenderingHints.KEY_ANTIALIASING,

		RenderingHints.VALUE_ANTIALIAS_ON);

		renderingHints.put(RenderingHints.KEY_RENDERING,

		RenderingHints.VALUE_RENDER_QUALITY);

		g2d.setRenderingHints(renderingHints);

		g2d.setFont(font);

		g2d.setColor(new Color(255, 255, 0));

		final GradientPaint gradientPaint = new GradientPaint(0, 0,

		Color.black, 0, height / 2, Color.black, true);

		g2d.setPaint(gradientPaint);

		g2d.fillRect(0, 0, width, height);

		g2d.setColor(new Color(255, 153, 0));

		Random random = new Random();

		int xCordinate = 0;

		int yCordinate = 0;

		for (int i = 0; i < data[0].length; i++) {

			xCordinate += 10 + (Math.abs(random.nextInt()) % 15);

			if (xCordinate >= width - 5) {

				xCordinate = 0;

			}

			yCordinate = 20 + Math.abs(random.nextInt()) % 20;

			g2d.drawChars(data[0], i, 1, xCordinate, yCordinate);

		}

		g2d.dispose();
		final String captcha = String.copyValueOf(data[0]);
		System.out.print("captchas: " + captcha);
		request.getSession().setAttribute("captcha", captcha);
		response.setContentType("image/png");

		final OutputStream outputStream = response.getOutputStream();

		ImageIO.write(bufferedImage, "png", outputStream);

		outputStream.close();

	}

	protected void doGet(HttpServletRequest request,

	HttpServletResponse response) throws ServletException, IOException {

		processRequest(request, response);

	}

	protected void doPost(HttpServletRequest request,

	HttpServletResponse response) throws ServletException, IOException {

		processRequest(request, response);

	}

	public static String getRandomNumber(int length) {

		String chars = "abcdefghjijkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ123456789";

		Random random = new Random();

		char[] buf = new char[length];

		for (int i = 0; i < length; i++) {

			buf[i] = chars.charAt(random.nextInt(chars.length()));

		}

		return new String(buf);

	}

}
