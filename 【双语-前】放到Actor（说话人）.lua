

local tr = aegisub.gettext

script_name = tr"【双语-前】放到Actor（说话人）"
script_description = tr"【双语-前】做双语之前处理：把字幕放到Actor（说话人）一栏"
script_author = "作孽造情敌"
script_version = "1"

function main(subtitles, selected_lines, active_line)
    for i=1,subtitles.n,1 do
        local line = subtitles[i]
        if line.class=="dialogue" then
        line.text = line.text:gsub("\\N", "　")
        --先把 日文字幕里原有的\N 替换为 日文的空格
        line.actor = line.text
        --把 text 复制到  actor
        line.text = ""
        --把 text 清空
        subtitles[i] = line
        end
    end
    aegisub.set_undo_point(script_name)
end

aegisub.register_macro(script_name, script_description, main)

