package net.sourceforge.anubis.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import net.sourceforge.anubis.domain.Operation;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "operation", automaticallyMaintainView = true, formBackingObject = Operation.class)
@RequestMapping("/operation/**")
@Controller
public class OperationController {
}
