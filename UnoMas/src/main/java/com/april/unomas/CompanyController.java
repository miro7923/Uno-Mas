package com.april.unomas;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
public class CompanyController {

	@RequestMapping(value = "/about_us")
	public String aboutus() {
		return "company/about_us";
	}
}
