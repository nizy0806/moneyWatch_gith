var eventModal = $('#eventModal');

var modalTitle = $('.modal-title');
var editAllDay = $('#edit-allDay'); //하루 종일
var editId = $('#edit-id'); //회원ID
var editTitle = $('#edit-title'); //일정명
var editStart = $('#edit-start'); //시작일
var editEnd = $('#edit-end'); //종료일
var editPlace = $('#edit-place') //장소
//var editType = $('#edit-type'); //구분
var editColor = $('#edit-color'); //색상
var editMemo = $('#edit-memo'); //메모

var addBtnContainer = $('.modalBtnContainer-addEvent');
var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');


/* ****************
 *  새로운 일정 생성
 * ************** */
var newEvent = function (start, end, eventType) {

    $("#contextMenu").hide(); //메뉴 숨김

    modalTitle.html('새로운 일정');
    //editType.val(eventType).prop('selected', true);
    editTitle.val('');
    editStart.val(start);
    editEnd.val(end);
    editMemo.val('');
    editPlace.val('');
    
    addBtnContainer.show();
    modifyBtnContainer.hide();
    eventModal.modal('show');

    /******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/
    var eventId = 1 + Math.floor(Math.random() * 1000);
    /******** 임시 RAMDON ID - 실제 DB 연동시 삭제 **********/

    //새로운 일정 저장버튼 클릭
    $('#save-event').unbind();
    $('#save-event').on('click', function () {
        var eventData = {
            id: editId.val(), //회원ID
            title: editTitle.val(), //일정명
            start_time: editStart.val(), //시작일
            end_time: editEnd.val(), //종료일
            memo: editMemo.val(), //메모
            place: editPlace.val(), //장소
            //type: editType.val(), //구분
            //username: '사나',
            backgroundColor: editColor.val(),
            textColor: '#ffffff',
            allDay: false
        };

        if (eventData.start_time > eventData.end_time) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if (eventData.title === '') {
            alert('일정명은 필수입니다.');
            return false;
        }

        var realEndDay;

        if (editAllDay.is(':checked')) {
            eventData.start_time = moment(eventData.start_time).format('YYYY-MM-DD');
            //render시 날짜표기수정
            eventData.end_time = moment(eventData.end_time).add(1, 'days').format('YYYY-MM-DD');
            //DB에 넣을때(선택)
            realEndDay = moment(eventData.end_time).format('YYYY-MM-DD');

            eventData.allDay = true;
        }

        $("#calendar").fullCalendar('renderEvent', eventData, true);
        eventModal.find('input, textarea').val('');
        editAllDay.prop('checked', false);
        eventModal.modal('hide');

        //새로운 일정 저장
        $.ajax({
            type: "post", 
            url: "Calendarinsert.mw", // 클라이언트가 요청 보낼 서버의 url주소
            data: { // Http요청과 함께 서버로 보낼 데이터
            	id: editId.val(), //회원ID
                title: editTitle.val(), //일정명
                start_time: editStart.val(), //시작일
                end_time: editEnd.val(), //종료일
                memo: editMemo.val(), //메모
                place: editPlace.val(), //장소
                //type: editType.val(), //구분
                //username: '사나',
                backgroundColor: editColor.val(),
                textColor: '#ffffff',
            },
            success: function (data) {
            	console.log(data);
            	$('#calendar').fullCalendar('removeEvents');
                $('#calendar').fullCalendar('refetchEvents');
            }
        });
        
    });
};