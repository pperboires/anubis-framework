package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.ManualGroupAssignedCommonRole;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "manualgroupassignedcommonrole", automaticallyMaintainView = true, formBackingObject = ManualGroupAssignedCommonRole.class)
@RequestMapping("/manualgroupassignedcommonrole/**")
@Controller
public class ManualGroupAssignedCommonRoleController {
}
