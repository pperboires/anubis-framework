package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.ManualGroupAssignedAdministrativeRole;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "manualgroupassignedadministrativerole", automaticallyMaintainView = true, formBackingObject = ManualGroupAssignedAdministrativeRole.class)
@RequestMapping("/manualgroupassignedadministrativerole/**")
@Controller
public class ManualGroupAssignedAdministrativeRoleController {
}
