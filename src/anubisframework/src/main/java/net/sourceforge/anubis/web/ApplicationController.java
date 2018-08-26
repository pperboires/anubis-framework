package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.Application;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "application", automaticallyMaintainView = true, formBackingObject = Application.class)
@RequestMapping("/application/**")
@Controller
public class ApplicationController {
}
