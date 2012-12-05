<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

class Leads_Hooks {

    private function syncService($lead, $target, $service) {
        $relationship = "aknet_service{$service}_leads";
        $lead->load_relationship($relationship);
        $beans = $lead->$relationship->getBeans();

        $target_name = $target->table_name;
        $target_relationship = "aknet_service{$service}_{$target_name}";
        $target->load_relationship($target_relationship);

        $targetBeans = $target->$target_relationship->getBeans();
        $diff = array_diff(array_keys($beans), array_keys($targetBeans));
        foreach($diff as $bean) {
            $target->$target_relationship->add($beans[$bean]);
        }

    }

    public function syncServices(Lead $lead, $event, $arguments) {
        if ($lead) {
            if (!empty($lead->contact_id) && empty($lead->account_id)) {
                $contact = new Contact();
                $contact->retrieve($lead->contact_id);
                $this->syncService($lead, $contact, 'internet');
                $this->syncService($lead, $contact, 'tv');
                $this->syncService($lead, $contact, 'vpnl2');
            }

            if (!empty($lead->account_id)) {
                $account = new Account();
                $account->retrieve($lead->account_id);
                $this->syncService($lead, $account, 'internet');
                $this->syncService($lead, $account, 'tv');
                $this->syncService($lead, $account, 'vpnl2');
            }

            if (!empty($lead->opportunity_id)) {
                $opportunity = new Opportunity();
                $opportunity->retrieve($lead->opportunity_id);
                $this->syncService($lead, $opportunity, 'internet');
                $this->syncService($lead, $opportunity, 'tv');
                $this->syncService($lead, $opportunity, 'vpnl2');
            }
        }
    }
}
