let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.visual.left = [['#6132d7', '#dcd7f9', 62, 189], ['#4d4031', '#e0d5ca', 238, 188]]
let s:p.tabline.tabsel = [['#4d4031', '#e0d5ca', 238, 188]]
let s:p.tabline.middle = [['#5f503e', '#f6f3f0', 239, 255]]
let s:p.tabline.left = [['#5f503e', '#f6f3f0', 239, 255]]
let s:p.replace.left = [['#7E6901', '#FEF0B4', 94, 229], ['#4d4031', '#e0d5ca', 238, 188]]
let s:p.normal.warning = [['#7E6901', '#FEF0B4', 94, 229]]
let s:p.normal.right = [['#403528', '#d6c6b6', 236, 187], ['#403528', '#d6c6b6', 236, 187], ['#4d4031', '#e0d5ca', 238, 188]]
let s:p.normal.middle = [['#5a4b3a', '#eae4dd', 239, 254]]
let s:p.normal.left = [['#403528', '#d6c6b6', 236, 187], ['#4d4031', '#e0d5ca', 238, 188]]
let s:p.normal.error = [['#A50303', '#F7D9D9', 124, 224]]
let s:p.insert.left = [['#1E5571', '#E7F4F8', 23, 255], ['#4d4031', '#e0d5ca', 238, 188]]
let s:p.inactive.right = [['#836e57', '#eae4dd', 95, 254], ['#836e57', '#eae4dd', 95, 254], ['#836e57', '#eae4dd', 95, 254]]
let s:p.inactive.middle = [['#836e57', '#eae4dd', 95, 254]]
let s:p.inactive.left = [['#836e57', '#eae4dd', 95, 254], ['#836e57', '#eae4dd', 95, 254], ['#836e57', '#eae4dd', 95, 254]]
let g:lightline#colorscheme#yui#palette = lightline#colorscheme#fill(s:p)