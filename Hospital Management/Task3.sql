use task2;

select a.username,i.type,ai.quality,i.name
from accounts_items as ai
inner join accounts a 
on a.id = ai.account_id
inner join items i 
on ai.item_id = i.id
where 
    ai.quality = (
        select max(ai_sub.quality)
        from accounts_items ai_sub
        inner join items i_sub on ai_sub.item_id = i_sub.id
        where ai_sub.account_id = ai.account_id
          and i_sub.type = i.type
    )
order by a.username, 
    case 
        when i.type = 'armor' then 1
        when i.type = 'shield' then 2
        when i.type = 'sword' then 3
        else 4
    end,  
    ai.quality;
