package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.UserInactivation;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "userinactivation", automaticallyMaintainView = true, formBackingObject = UserInactivation.class)
@RequestMapping("/userinactivation/**")
@Controller
public class UserInactivationController {
}
