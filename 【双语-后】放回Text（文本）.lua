

local tr = aegisub.gettext

script_name = tr"【双语-后】放回Text（文本）"
script_description = tr"【双语-后】做双语之后处理：把字幕放回Text（文本）一栏"
script_author = "作孽造情敌"
script_version = "1"

function main(subtitles, selected_lines, active_line)
    for i=1,subtitles.n,1 do
        local line = subtitles[i]
        if line.class=="dialogue" then
        line.text = line.text .. "  \\N  "  .. line.actor
        --把text变为：【原text（已输入好的译文）】和 【两个空格】 和 \N 和 【两个空格】 和 【actor一栏内容（日文字幕）】
        line.actor = ""
        --把 actor 清空
        subtitles[i] = line
        end
    end
    aegisub.set_undo_point(script_name)
end

aegisub.register_macro(script_name, script_description, main)

