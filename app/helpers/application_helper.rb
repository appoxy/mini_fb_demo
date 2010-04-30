# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

    def flasher
        f_names = [:success, :info, :warning, :error]
        fl = ''

        for name in f_names
            if flash[name]
                fl = fl + "<div class=\"flash #{name}\">#{flash[name]}</div>"
            end
            flash[name] = nil;
        end
        return fl
    end

    def print_val(val)
        ret = ''
        if val.is_a? Hash
            ret += '<ul>'
            val.each_pair do |k, v|
                ret += '<li>' + k.to_s + ': '
                if k == "id"
                    @id = v unless @id
                    ret += link_to(print_val(v), :controller => "welcome", :action=>"show", :id=>v)
                elsif @connections
                    ret += link_to(k, :controller => "welcome", :action=>"show", :id=>@id, :type=>k)
                elsif k == "link"
                    ret += link_to(v, v)
                else
                    @connections = true    if k == "connections"
                    ret += print_val(v) + '</li>'
                    @connections = false if k == "connections"
                end

            end
            ret += '</ul>'
        elsif val.is_a? Array
            ret += '['
            val.each do |v|
                ret += ",<br/>" + print_val(v)
            end
            ret += ']'
        else
            ret += val.to_s
        end
        ret
    end

end
