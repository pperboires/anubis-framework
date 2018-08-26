package net.sourceforge.anubis.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import net.sourceforge.anubis.domain.Operation;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect OperationDataOnDemand_Roo_DataOnDemand {
    
    declare @type: OperationDataOnDemand: @Component;
    
    private Random OperationDataOnDemand.rnd = new SecureRandom();
    
    private List<Operation> OperationDataOnDemand.data;
    
    public Operation OperationDataOnDemand.getNewTransientOperation(int index) {
        net.sourceforge.anubis.domain.Operation obj = new net.sourceforge.anubis.domain.Operation();
        return obj;
    }
    
    public Operation OperationDataOnDemand.getSpecificOperation(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size()-1)) index = data.size() - 1;
        Operation obj = data.get(index);
        return Operation.findOperation(obj.getUid());
    }
    
    public Operation OperationDataOnDemand.getRandomOperation() {
        init();
        Operation obj = data.get(rnd.nextInt(data.size()));
        return Operation.findOperation(obj.getUid());
    }
    
    public boolean OperationDataOnDemand.modifyOperation(Operation obj) {
        return false;
    }
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void OperationDataOnDemand.init() {
        if (data != null) {
            return;
        }
        
        data = net.sourceforge.anubis.domain.Operation.findOperationEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Operation' illegally returned null");
        if (data.size() > 0) {
            return;
        }
        
        data = new java.util.ArrayList<net.sourceforge.anubis.domain.Operation>();
        for (int i = 0; i < 10; i++) {
            net.sourceforge.anubis.domain.Operation obj = getNewTransientOperation(i);
            obj.persist();
            data.add(obj);
        }
    }
    
}
