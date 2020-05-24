package wang.miansen.roothub.common.dto;

import lombok.Data;

@Data
public class CommentDTO {
    private String CommentThing;
    private Integer Father_id;
    private Integer WorkId;
}
