package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.UserAssignedSecurityAdministrativeRole;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "userassignedsecurityadministrativerole", automaticallyMaintainView = true, formBackingObject = UserAssignedSecurityAdministrativeRole.class)
@RequestMapping("/userassignedsecurityadministrativerole/**")
@Controller
public class UserAssignedSecurityAdministrativeRoleController {
}
