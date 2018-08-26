package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.CommonRole;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "commonrole", automaticallyMaintainView = true, formBackingObject = CommonRole.class)
@RequestMapping("/commonrole/**")
@Controller
public class CommonRoleController {
}
