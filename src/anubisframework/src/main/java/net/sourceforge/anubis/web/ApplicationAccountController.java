package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.ApplicationAccount;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "applicationaccount", automaticallyMaintainView = true, formBackingObject = ApplicationAccount.class)
@RequestMapping("/applicationaccount/**")
@Controller
public class ApplicationAccountController {
}
