package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.AdministrativeRole;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "administrativerole", automaticallyMaintainView = true, formBackingObject = AdministrativeRole.class)
@RequestMapping("/administrativerole/**")
@Controller
public class AdministrativeRoleController {
}
